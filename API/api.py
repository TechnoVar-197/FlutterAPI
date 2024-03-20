from flask import Flask as fk
from flask import request, jsonify
app = fk(__name__)


@app.route('/api', methods=['GET'])
def returnascii():
    d = {}
    chr = str(request.args["query"])
    ans = str(ord(chr))
    d['output'] = ans
    return d


if __name__ == "__main__":
    app.run()
