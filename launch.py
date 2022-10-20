import sys
def start_webui():
    print(f"Launching Web UI with arguments: {' '.join(sys.argv[1:])}")
    import webui
    webui.webui()

if __name__ == "__main__":
    start_webui()