FROM python:3.9

WORKDIR /app/flask_app

COPY /flask_app/ /app/flask_app
COPY models/vectorizer.pkl /app/flask_app/models/vectorizer.pkl

RUN pip install -r requirements.txt
RUN python -m nltk.downloader stopwords wordnet


ENV PYTHONPATH=/app


EXPOSE 5000

#CMD ["gunicorn","-b","0.0.0.0:5000","app:app"]

CMD ["python","flask_app.app.py","0.0.0.0:5000"]