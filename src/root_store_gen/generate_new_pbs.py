import sys
import os.path as path
import pathlib
import importlib.util
import sys
import crs_pb2
def usage():
    print("Usage: <proto input> <new ca key>... <proto output>")
cwd = path.dirname(path.abspath(sys.argv[0]))
if len(sys.argv) < 4:
    usage()
    exit(-1)
cas = []
for a in sys.argv[2:-1:]:
    print(f"Registering CA from {a}")
    cas.append(a)
outfile = sys.argv[-1]
print(f'reading from: {sys.argv[1]}')
print(f"Outputing to: {outfile}")
out = open(outfile, 'wb')
buf= open(sys.argv[1], 'rb')
rs = crs_pb2.RootStore()
rs.ParseFromString(buf.read())
print(rs.trust_anchors)
for ca in cas:
    with open(ca, 'rb') as file:
        print(f"Loading Certificate Authority {ca} into rootstore")
        der = file.read()
        next_trust_anchor = crs_pb2.TrustAnchor()
        next_trust_anchor.Clear()
        next_trust_anchor.der = der
        next_trust_anchor.display_name = "Success!"
        print(next_trust_anchor.constraints)
        rs.trust_anchors.append(next_trust_anchor)
out.write(rs.SerializeToString())
out.close()