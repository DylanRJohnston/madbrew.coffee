module.exports = {
    servers: {
        one: {
            host: 'madbrew.coffee',
            username: 'root',
            opts: {
                port: 2222
            }
        }
    },
    meteor: {
        name: 'madbrew',
        path: './app',
        env: {
            ROOT_URL: 'https://madbrew.coffee',
            MONGO_URL: 'mongodb://localhost/madbrew'
        },
        servers: {one: {}},
        ssl: {
            port: 443,
            crt: './app/private/fullchain.pem',
            key: './app/private/privkey.pem'
        }
    },
    mongo: {
        oplog: true,
        port: 27017,
        servers: {one: {}}
    }
}
