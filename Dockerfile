FROM python:3.9

WORKDIR /app

COPY /flask_app/ /app/
COPY models/vectorizer.pkl /app/models/vectorizer.pkl

RUN pip install -r requirements.txt
RUN python -m nltk.downloader stopwords wordnet


ENV PYTHONPATH=/app


EXPOSE 5000

CMD ["python","flask_app/app.py","0.0.0.0:5000"]