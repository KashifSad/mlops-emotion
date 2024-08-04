from flask import Flask,render_template,request
import mlflow
from preprocessing_utility import normalize_text
import dagshub
import pickle

mlflow.set_tracking_uri('https://dagshub.com/KashifSad/mlops-emotion.mlflow')
dagshub.init(repo_owner='KashifSad', repo_name='mlops-emotion', mlflow=True)


app = Flask(__name__)



model_name = "my_model"
model_version = 2

model_uri = f"models:/{model_name}/{model_version}"
model = mlflow.pyfunc.load_model(model_uri)

vectorizer = pickle.load(open(r'C:\Users\MV\Desktop\MLOPS - Copy - Copy\mini-project\models\vectorizer.pkl','rb'))







@app.route("/")
def home():
    return render_template('index.html', result=None)



@app.route('/predict',methods=['POST'])
def predict():
    text = request.form['text']

    text = normalize_text(text)
    


    features = vectorizer.transform([text])


    result = model.predict(features)

    return render_template('index.html', result=result[0])


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
