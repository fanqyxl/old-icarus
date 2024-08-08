import sys
import os.path as path
import pathlib
import importlib.util
import sys
import crs_pb2
def usage():
    print("Usage: <proto input> <proto output>")
cwd = path.dirname(path.abspath(sys.argv[0]))
if len(sys.argv) < 2:
    usage()
    exit(-1)
buf= open(sys.argv[1], 'rb')
rs = crs_pb2.RootStore()
rs.ParseFromString(buf.read())
print(rs.trust_anchors[0])