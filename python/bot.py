#!/root/.venv/bin/python
from telegram import Bot
import asyncio
from time import sleep

async def sen_message(host, port):
    bot = Bot(token="TOKEN")
    channel_id = chanell_id
    message = f"ssh root@{host} -p {port}"
    try:
        await bot.send_message(chat_id=channel_id, text=message)
    except Exception as e:
        print(f"Error sending message: {e}")


def launch_ngrok():
    import psutil
    ngrok_proc = False
    for proc in psutil.process_iter(['name', 'pid']):
        if 'ngrok' in proc.info['name']:
            ngrok_proc = True
    return ngrok_proc


def ngrok_connect():
    from pyngrok import ngrok
    tcp_connect = ngrok.connect(22, "tcp")
    result = tcp_connect.public_url.split(":")
    host = result[1][2:]
    port = result[2]
    return host, port


def run_ngrok():
    import threading
    th = threading.Thread(target=ngrok_connect)
    th.start()


if __name__ == "__main__":
    while True:
        if launch_ngrok():
            print('ngrok already running, waiting for tunnel to be established...')
            sleep(3600)
        else:
            host, port = ngrok_connect()
            asyncio.run(sen_message(host, port))
            print("ngrok tunnel established, sending message...")
            run_ngrok()

