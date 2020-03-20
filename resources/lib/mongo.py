from pymongo import MongoClient

client = MongoClient("mongodb://qaninja:qaninja123@ds155903.mlab.com:55903/bikelovdb")
db = client['bikelovdb']

def remove_bike(name):
    bikes = db['bikes']
    bikes.delete_many({'name':name})
