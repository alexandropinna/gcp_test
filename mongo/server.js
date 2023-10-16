require('dotenv').config();

const express = require('express');
const { MongoClient, ServerApiVersion } = require('mongodb');
const app = express();

const uri = process.env.MONGO_URI;

const client = new MongoClient(uri, {
  serverApi: {
    version: ServerApiVersion.v1,
    strict: true,
    deprecationErrors: true,
  }
});

let db;

async function initMongo() {
    try {
        await client.connect();
        console.log("Pinged your deployment. You successfully connected to MongoDB!");
        db = client.db('gcpdb');
    } catch (err) {
        console.error(err);
    }
}
initMongo();

app.set('view engine', 'ejs');

app.get('/list', async (req, res) => {
    try {
        const collection = db.collection('gcpcollection');
        const items = await collection.find().toArray();
        res.render('list', { items: items });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al obtener los datos');
    }
});

app.listen(3000, () => {
    console.log('Servidor escuchando en http://localhost:3000');
});


const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));

app.post('/add', async (req, res) => {
    try {
        const itemNombre = req.body.nombre;
        const collection = db.collection('gcpcollection');
        await collection.insertOne({ nombre: itemNombre });
        res.redirect('/list');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al agregar el ítem');
    }
});


app.post('/delete', async (req, res) => {
    try {
        const itemNombre = req.body.nombre;
        const collection = db.collection('gcpcollection');
        await collection.deleteOne({ nombre: itemNombre });
        res.redirect('/list');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al eliminar el ítem');
    }
});
