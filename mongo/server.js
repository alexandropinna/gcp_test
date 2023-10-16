// Load environment variables from .env file
require('dotenv').config();

// Importing required modules
const express = require('express');
const { MongoClient, ServerApiVersion } = require('mongodb');
const bodyParser = require('body-parser');

// Initializing express app
const app = express();

// MongoDB connection string
const uri = process.env.MONGO_URI;

// Create a new MongoClient with specific server API configuration
const client = new MongoClient(uri, {
  serverApi: {
    version: ServerApiVersion.v1, // Set MongoDB server API version
    strict: true, // Force server to run in strict mode
    deprecationErrors: true, // Return error on deprecated features
  }
});

let db; // Variable to store the connected database

// Function to initialize MongoDB connection
async function initMongo() {
    try {
        await client.connect();
        console.log("Pinged your deployment. You successfully connected to MongoDB!");
        db = client.db('gcpdb'); // Selecting 'gcpdb' database
    } catch (err) {
        console.error(err);
    }
}
initMongo();

// Setting view engine to EJS for template rendering
app.set('view engine', 'ejs');

// Endpoint to list all items from the 'gcpcollection' collection
app.get('/list', async (req, res) => {
    try {
        const collection = db.collection('gcpcollection');
        const items = await collection.find().toArray();
        res.render('list', { items: items });
    } catch (err) {
        console.error(err);
        res.status(500).send('Error fetching data');
    }
});

// Setting up body-parser middleware to parse POST request bodies
app.use(bodyParser.urlencoded({ extended: true }));

// Endpoint to add a new item to the 'gcpcollection' collection
app.post('/add', async (req, res) => {
    try {
        const itemNombre = req.body.nombre;
        const collection = db.collection('gcpcollection');
        await collection.insertOne({ nombre: itemNombre });
        res.redirect('/list');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error adding item');
    }
});

// Endpoint to delete an item from the 'gcpcollection' collection based on the name
app.post('/delete', async (req, res) => {
    try {
        const itemNombre = req.body.nombre;
        const collection = db.collection('gcpcollection');
        await collection.deleteOne({ nombre: itemNombre });
        res.redirect('/list');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error deleting item');
    }
});

// Starting the express server on port 3000
app.listen(3000, () => {
    console.log('Server listening at http://localhost:3000');
});
