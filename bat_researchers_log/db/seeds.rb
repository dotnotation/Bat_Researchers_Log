User.create(
    username: "mtuttle", 
    email: "merlintuttle@merlintuttle.com", 
    organization: "Merlin Tuttle's Bat Convervation", 
    password: "ilovebats"
)

User.create(
    username: "abrokaw", 
    email: "abrokaw@batcon.com", 
    organization: "Bat Conservation International", 
    password: "ilovebats"
)

Bat.create(
    identification: "PL24568",
    nickname: "Fox",
    species: "Pteropus Livingstonii",
    date_found: "2020-07-23",
    location: "Taolagnaro, Madagascar",
    date_last_seen: "2020-10-31",
    weight: 850,
    age: 10,
    sex: "F",
    wing_span: 101,
    colony_size: 98,
    conservation_status: "Endangered",
    white_nose_syndrome: false,
    notes: "Middle aged female found with two pups. No signs of disease. Rearing a pup.",
    user_id: 1
)

Bat.create(
    identification: "EA78990",
    nickname: "Ghost",
    species: "Ectophylla Alba",
    date_found: "2020-09-02",
    location: "Choloma, Honduras",
    date_last_seen: "2021-03-14",
    weight: 5,
    age: 7,
    sex: "M",
    wing_span: 7,
    colony_size: 8,
    conservation_status: "Near Threatened",
    white_nose_syndrome: true,
    notes: "Male found roosting under a leaf with minor tear in wing membrane.",
    user_id: 2
)