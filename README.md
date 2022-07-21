<div id="top" align="center">
  <a href="https://www.microverse.org/">
    <img alt="Microverse" src="https://img.shields.io/badge/-Microverse-blueviolet?style=flat-square">
  </a>
  <a href="./LICENSE">
    <img alt="AGPL Licensed" src="https://img.shields.io/github/license/UpliftLab/al-mentoria-backend">
  </a>
  <a href="https://github.com/UpliftLab/al-mentoria-backend">
    <img alt="GitHub last commit (branch)" src="https://img.shields.io/github/last-commit/UpliftLab/al-mentoria-backend/dev?color=blue&style=flat-square">
  </a>
  <a href="https://github.com/UpliftLab/al-mentoria-backend">
    <img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/UpliftLab/al-mentoria-backend?color=green&label=%E2%98%85%20stars%20&style=flat-square">
  </a>
  <a href="https://github.com/UpliftLab">
    <img alt="GitHub followers" src="https://img.shields.io/github/followers/UpliftLab?color=yellow&logo=github&style=flat-square">
  </a>
</div>

<br />

<div id="header" align="center">
  <a href="https://github.com/UpliftLab/al-mentoria-docs/blob/9fcf7f54b99a1c4264cbcfa5644e5526cf02b2a7/almentoria-full-logo.svg">
    <img src="https://github.com/UpliftLab/al-mentoria-docs/blob/9fcf7f54b99a1c4264cbcfa5644e5526cf02b2a7/almentoria-full-logo.svg" alt="Logo" width="200" height="200">
  </a>
  <p align="center">
    <br />
    <a href="https://almentoria-api.herokuapp.com/api-docs/index.html"><strong>Explore the API docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/UpliftLab/al-mentoria-backend">View Demo</a>
    ·
    <a href="https://github.com/UpliftLab/al-mentoria-backend/issues">Report Bug</a>
    ·
    <a href="https://github.com/UpliftLab/al-mentoria-backend/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>TABLE OF CONTENTS</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#erd-diagram">ERD diagram</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#authors">Authors</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<br />

## About The Project

> **Al Mentoria** is a virtual space to connect with mentors that can help you with your technical as well as behavioral issues. If you are stuck somewhere and need a second look at things, make a reservation now.

### ERD diagram
<img alt="ERD diagram" src="https://github.com/UpliftLab/al-mentoria-docs/blob/9fcf7f54b99a1c4264cbcfa5644e5526cf02b2a7/erd.png">

### Built With

<ul style="display: flex; gap: 6px; justify-content: center">
<img src="https://img.shields.io/badge/postgresql-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white"/>
<img src="https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white"/>
<img src="https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white"/>
<img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/>
<br></br>
</ul>

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- POSTGRESQL *~> 14.x*
- Ruby *~> 3.1.x*

### Installation

1. Clone the repo:
   ```sh
   git clone git@github.com:UpliftLab/al-mentoria-backend.git
   ```
2. go to the project folder: 
   ```sh
   cd al-mentoria-backend
   ```
3. Install the dependencies:
   ```sh
   bundle install
   ```
4. Set the following the environment variables for database:
   ```
   PG_DB_USERNAME
   PG_DB_PASSWORD
   ```
5. Create database:
   ```sh
   rails db:create
   ```
6. Run the migrations:
   ```sh
   rails db:migrate
   ```
7. Seed the database:
   ```sh
   rails db:seed
   ```

8. Launch the server:
   ```sh
   rails s -p 8000
   ```
9. Enjoy

## Usage

_For more Info on how to use the API, please refer to the [al mentoria API Documentation](https://almentoria-api.herokuapp.com/api-docs/index.html)_

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

Please, take a look at [open issues](https://github.com/UpliftLab/al-mentoria-backend/issues) for a full list of proposed features (and known issues).

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


##  Authors

👤 **Soufiane Boursen**

- GitHub: [@Sboursen](https://github.com/Sboursen)
- LinkedIn: [@sboursen](https://linkedin.com/in/sboursen)
- Twitter: [@sboursen_dev](https://twitter.com/sboursen_dev)

👤 **Ammar Hamlaoui**

- GitHub: [@mirouhml](https://github.com/mirouhml)
- LinkedIn: [ammar-hamlaoui](https://www.linkedin.com/in/ammar-hamlaoui-514909189/)
- Twitter: [@kuronomirou](https://twitter.com/kuronomirou)

👤 **Mostafa Ahangarha**

- GitHub: [ahangarha](https://github.com/ahangarha)
- LinkedIn: [ahangarha](https://www.linkedin.com/in/ahangarha/)
- Twitter: [@ahangarha](https://twitter.com/ahangarha)

👤 **Awais Amjed**
- GitHub: [Awais Amjed](https://github.com/awais-amjed)
- Website: [Coding Fries](https://codingfries.com)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/awais-amjed)

## Acknowledgments

* Original design by [Murat Korkmaz](https://www.behance.net/muratk).
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Img Shields](https://shields.io)
* [React Icons](https://react-icons.github.io/react-icons/search)

## License

Distributed under the **AGPL** License. See [`LICENSE`](./LICENSE) for more information.
