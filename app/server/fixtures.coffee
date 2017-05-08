if Coffees.find().count() == 0
    coffees = [
            name: "Primaveral"
            description: "From the high mountains of the Huila region of Columbia."
            tasting_notes: "Cola, dark chocolate aroma, white grape and baker's chocolate flavour, sparkling acidity and juicy texture."
            taste:
                roast: 1
                body: 1
                acidity: 1
            image: "/primaveral_logo.jpg"
            price: "400"
            item_id: "Darkhorse"
    ]

    Coffees.insert coffee for coffee in coffees

if Locations.find().count() == 0
    locations = [
            name: "BloomLab at St Cat's"
            description: "Co-working space at St Catherine's College, UWA"
            address: "2nd Floor, St Catherine's College, 2 Park Rd, Crawley WA 6009"
            image: "/bloom_logo.jpg"
            location:
                lattitude: -31.975442
                longitude: 115.816709,

            name: "Spacecubed"
            description: "Spacecubed is a Social Enterprise, designed to support 20,000 Startups, Entrepreneurs and Corporate Innovators by 2025."
            address: "45 St Georges Terrace, Perth
            Perth, Western Australia, WA 6000"
            image: "/spacecubed.jpg"
            location:
                lattitude: -31.955615
                longitude: 115.859481
    ]

    Locations.insert location for location in locations
