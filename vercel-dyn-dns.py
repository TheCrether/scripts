#!/usr/bin/python3

# Original code from https://github.com/MattMoony

import json
import requests as req
from time import sleep
from datetime import datetime
from subprocess import check_output, STDOUT


def get_public_ip():
    return check_output("bash fritzbox-get-wan-ip.sh 10.0.0.1", stderr=STDOUT, shell=True).decode().strip()
    # try:
    #     status = json.loads(req.get('https://wtfismyip.com/json').text)
    #     return status['YourFuckingIPAddress']
    # except req.exceptions.ConnectionError:
    #     print('[!] WTFISMYIP: Error - Connection failed!')
    # except json.JSONDecodeError:
    #     print('[!] WTFISMYIP: Error - Unexpected response!')


def err(msg, text, r):
    print(msg)
    with open('dyn-dns.log', 'a') as f:
        f.write('[{}]: ERROR UPDATING "{}" {}\n'.format(
            datetime.now().isoformat(), r['name'], '-'*16))
        f.write('\t' + text + '\n')
        f.write('\n')


def update_dns_record(ip):
    global CONF
    print('='*64)
    for r in CONF['records']:
        try:
            domains = json.loads(
                req.get(f'https://vercel.com/api/v4/domains/{CONF["domain"]}/records',
                        headers={'Authorization': "Bearer " + CONF["auth_token"]}).text)
            if "code" in domains and domains['code'] == "not_found":
                err('[!] DYN-DNS: Error - Could not update DNS record ... (Logging response) ',
                    json.dumps(domains), r)
                return
            rec = next(filter(lambda rec: rec["name"] ==
                       r["name"], domains['records']), None)
            if rec == None:
                err(
                    f'[!] DYN-DNS: Error - Could not find record with name "{r["name"]} ... (Logging response)"', json.dumps(domains), r)
                return
            res = req.patch(f'https://vercel.com/api/v4/domains/records/{rec["id"]}',
                            headers={'Content-Type': 'application/json',
                                     'Authorization': "Bearer " + CONF["auth_token"]},
                            json={'name': r['name'], 'ttl': r['ttl'], 'value': ip, 'type': 'A'})
            if res.status_code != 200:
                err('[!] DYN-DNS: Error - Could not update DNS record ... (Logging response) ', res.text, r)
            else:
                print(
                    '[+] Updated DNS-Record "{}" ... (new-ip: {})'.format(r['name'], ip))
        except req.exceptions.ConnectionError:
            print('[!] DYN-DNS: Error - Connection failed!')
        except json.JSONDecodeError:
            print('[!] DYN-DNS: Error - Unexpected response!')


CONF = {}


def main():
    print(get_public_ip())
    global CONF

    ip = ''
    try:
        while True:
            with open('./dyn-conf.json', 'r') as f:
                CONF = json.loads(f.read())
            cuip = get_public_ip()
            if cuip != None and cuip != ip:
                update_dns_record(cuip)
                ip = cuip
            sleep(CONF['timeout'])
    except KeyboardInterrupt:
        print('[*] Bye bye!')


if __name__ == '__main__':
    main()
