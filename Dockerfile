FROM amazonlinux:latest

RUN yum install -y zip

RUN amazon-linux-extras install -y python3


RUN mkdir /sqlite-lambda-dist/

COPY ./sqlite-lambda/ /sqlite-lambda-dist/

# re-installs sqlite by moving compiled c library into lambda's sys.path
RUN cp /usr/lib64/python3.6/lib-dynload/_sqlite3.cpython-36m-x86_64-linux-gnu.so /sqlite-lambda-dist/

# installs arbitrary packages to the dist folder
#RUN pip3 install -r /requirements.txt -t /sqlite-lambda-dist/
# compiles them so they can be found in the sys.path
#RUN python3 -m compileall /sqlite-lambda-dist/

ENV PYTHONPATH /sqlite-lambda-dist/

VOLUME ["/sqlite-lambda-dist"]
WORKDIR "/sqlite-lambda-dist"