#!/usr/bin/python3
import argparse
import pathlib


class DotfileMgr:
    def create_link_list(self):
        self.link_list = []
        for d in self.dot.glob('config/*/*'):
            link = {
                    'src' : self.home / ".config" / d.parent.name / d.name,
                    'dest': d.resolve(),
                    }
            self.link_list.append(link)

    def install_config(self):
        for l in self.link_list:
            try:
                l["src"].symlink_to(l["dest"])
            except FileExistsError:
                if l["src"].resolve() != l["dest"]:
                    print("!> Broken installation: {} -> {} (not {})".format(l["src"], l["src"].resolve(), l["dest"]))

    def install(self):
        self.install_config()

    def __init__(self):
        self.home = pathlib.Path.home()
        self.dot = pathlib.Path(__file__).resolve().parent
        self.create_link_list()
        

def main(cmd="install"):
    d = DotfileMgr()
    if cmd == "install":
        d.install()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("cmd", help="install")
    args = parser.parse_args()
    main(**(args.__dict__))
