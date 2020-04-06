from pymongo import MongoClient
import bson

client = MongoClient("mongodb://qaninja:qaninja123@ds155903.mlab.com:55903/bikelovdb?retryWrites=false")
db = client['bikelovdb']

def remove_bike(name):
    bikes().delete_many({'name':name})


def create_bike_ad(ad, user_id):
    remove_bike(ad['name'])
    ad["user"] = bson.objectid.ObjectId(user_id)
    return bikes().insert_one(ad).inserted_id

def get_mongo_id():
    return bson.objectid.ObjectId()

def bikes():
    return  db['bikes']