if Coffees.find().count() == 0
    coffees = [
            name: "Primaveral"
            description: "From the high mountains of the Huila region of Columbia."
            tasting_notes: "Cola, dark chocolate aroma, white grape and baker's chocolate flavour, sparkling acidity, juicy texture and finish."
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
                longitude: 115.816709
    ]

    Locations.insert location for location in locations
