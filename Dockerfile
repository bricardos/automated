FROM python:2.7.14

RUN pip install robotframework \
    && pip install --upgrade robotframework-httplibrary \
    && pip install --upgrade robotframework-selenium2library \
    && pip install -U requests \
    && pip install -U robotframework-requests

# Add more library below
RUN pip install robotframework-faker