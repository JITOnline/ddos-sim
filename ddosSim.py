  
from flask import Flask, render_template, request, url_for, redirect, flash
import subprocess
import shlex

app = Flask(__name__)
app.config['SECRET_KEY'] = '\xda\x84\x80\xd0\x87\xcf\xa0\x92\xaf\xd3\x9a\x8d\xa8\xb0\xa0o'

@app.route("/ddos-sim", methods=["GET", "POST"])
def ddosSim():
    if request.method == "POST":
        IP = request.form['ip']
        time = request.form['timeout']
        packetcount = request.form['packetcount']
        port = request.form['port']
        ttl = request.form['ttl']
        cmd = "hping3 -S -L 0000 -p {} -c {} --id 0xaaaa -i u5 --ttl {} {}".format(port, packetcount, ttl, IP)
        args = shlex.split(cmd)

        p = subprocess.Popen(args, stdout=subprocess.PIPE)

        try:
           output, error = p.communicate(timeout=int(time))
        except subprocess.TimeoutExpired:
           p.kill()
           output, error = p.communicate()

        flash("[info] ran command: {}".format(cmd))
        output_s = output.decode("utf-8")
        return render_template("simulator.html", data=output_s)
      
    my_url = url_for('ddosSim')
    return render_template("simulator.html", data=my_url)
