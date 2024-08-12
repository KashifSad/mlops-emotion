# FROM python:3.9-slim
# WORKDIR /app
# COPY flask_app/ /app/
# COPY models/vectorizer.pkl /app/models/vectorizer.pkl
# RUN pip install -r requirements.txt
# RUN python -m nltk.downloader stopwords wordnet
# ENV PYTHONPATH=/app
# EXPOSE 5000
# CMD ["gunicorn","-b","0.0.0.0:5000","app:app"]
# #CMD ["python",app.py","0.0.0.0:5000"]



FROM python:3.10-slim

WORKDIR /app

COPY flask_app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY models/vectorizer.pkl /appodels/

COPY flask_app/ /app/flask_app/

ENV PYTHONPATH="/app"

CMD ["python", "flask_app/app.py"]
