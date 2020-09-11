#!/usr/bin/python3
import argparse
import pathlib
import subprocess
import os


class Apt:
    def cmd(self, module, args=[]):
        os.system(" ".join(["sudo", "apt", module] + args))

    def install(self, pkgs, upgrade_first=False):
        if upgrade_first:
            self.cmd("update")
            self.cmd("upgrade")
        self.cmd("install", pkgs)


class DotfileMgr:
    def create_link_list(self):
        self.link_list = []
        for f in self.dot.glob('config/*/*'):
            link = {
                    'src' : self.home / ".config" / f.parent.name / f.name,
                    'dest': f.resolve(),
                    }
            self.link_list.append(link)
        for f in self.dot.glob('base/*'):
            link = {
                    'src' : self.home / ".{}".format(f.name),
                    'dest': f.resolve(),
                    }
            self.link_list.append(link)

    def install(self):
        for l in self.link_list:
            l["src"].parent.mkdir(parents=True, exist_ok=True)
            try:
                l["src"].symlink_to(l["dest"])
            except FileExistsError:
                if l["src"].resolve() != l["dest"]:
                    print("!> Broken installation: {} -> {} (not {})".format(l["src"], l["src"].resolve(), l["dest"]))

    def __init__(self):
        self.home = pathlib.Path.home()
        self.dot = pathlib.Path(__file__).resolve().parent
        self.create_link_list()
        

def main(cmd="install-user-config"):
    if cmd == "install-user-config":
        d = DotfileMgr()
        d.install()
    elif cmd == "install-apt":
        a = Apt()
        with open("debian-pkgs.txt") as f:
            pkgs = []
            for pkg in f:
                pkgs += [pkg.strip()]
            a.install(pkgs, upgrade_first=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("cmd", help="install")
    args = parser.parse_args()
    main(**(args.__dict__))
