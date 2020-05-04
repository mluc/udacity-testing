FROM python:3.7.3-stretch

WORKDIR /app

COPY . app.py /app/
RUN pip install -r requirements.txt

EXPOSE 8080
CMD ["python", "app.py"]