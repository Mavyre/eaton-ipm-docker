<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Mavyre/eaton-ipm-docker">
    <img src="images/Eaton_Corporation_logo.png" alt="Logo" width="250" height="87">
  </a>

<h3 align="center">Dockerised Eaton IPM</h3>

  <p align="center">
    Install and run Eaton® Intelligent Power® Manager onto a Debian docker container!
    <br />
    <a href="https://github.com/Mavyre/eaton-ipm-docker"><strong>Explore the official Eaton IPM documentation »</strong></a>
    <br />
    <br />
    <!--<a href="https://github.com/Mavyre/eaton-ipm-docker">View Demo</a>
    ·-->
    <a href="https://github.com/Mavyre/eaton-ipm-docker/issues">Report Bug</a>
    ·
    <a href="https://github.com/Mavyre/eaton-ipm-docker/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
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
    <li><a href="#license">License</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

"Eaton® Intelligent Power Manager® (IPM) is a power environmental device supervision tool for IT environments. The Eaton IPM delivers a global view across the network from any PC with an Internet browser."

Eaton® IPM is distributed on their [download page](http://powerquality.eaton.fr/support/software-drivers/downloads/intelligent-power-software.asp) either as a Windows server installer or as a Debian VM.
Setting up Docker is way more straightforward than setting up a VM environment and is much more lightweight. If you wish to install it on Docker instead of setting up their VM, this project is done for you!

This repository contains a Dockerfile which installs and runs Eaton® IPM on the latest Debian container, using their official "Virtual appliance" OVA file.
<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Docker][Docker.com]][Docker-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

* AMD64 platform architecture, or [emulate it](https://hub.docker.com/r/tonistiigi/binfmt)
* git
* [Docker](https://www.docker.com/)
 ```sh
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  ```

### Build the Docker image
   ```sh
   docker build https://github.com/Mavyre/eaton-ipm-docker.git
   ```
OR
   ```sh
   git clone https://github.com/Mavyre/eaton-ipm-docker.git
   cd eaton-ipm-docker
   docker build -t eaton-ipm .
   ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

```sh
docker run -d -p 4679:4679 -p 4680:4680 -v  ~/ipm/db:/usr/local/Eaton/IntelligentPowerManager/db -v ~/ipm/configs:/usr/local/Eaton/IntelligentPowerManager/configs Mavyre/eaton-ipm
```

IPM uses multiple ports, which are described in their [official documentation, page 4](https://www.eaton.com/content/dam/eaton/products/backup-power-ups-surge-it-power-distribution/power-management-software-connectivity/eaton-intelligent-power-manager/eaton-ipm-user-guide-p-164000289.pdf).
Mapping ports 4679 and 4680 (TCP/UDP) might be enough for initial setup, but you might want to add more ports depending on your usage of IPM, if you're using NUT on some appliances for instance, or SNMP, MQTT...
You can map every port marked as "IN" in the documentation.

The two folders `db` and `configs` are mapped on host to retain IPM configurations and database.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

The docker is distributed under the MIT License. See `LICENSE.txt` for more information.

Eaton® Intelligent Power® Manager is distributed under its own EULA that you must read and accept prior using it.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* Thanks to both [dersimn](https://github.com/dersimn/docker_eaton_ipp) and [ytzelf](https://github.com/ytzelf/docker-eaton-ipp) for their Eaton IPP containers that helped a lot to create this one
* [othneildrew](https://github.com/othneildrew) for their awesome [Best README template](https://github.com/othneildrew/Best-README-Template) which I recommended to kickstart any Readme file!

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Mavyre/eaton-ipm-docker.svg?style=for-the-badge
[contributors-url]: https://github.com/Mavyre/eaton-ipm-docker/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Mavyre/eaton-ipm-docker.svg?style=for-the-badge
[forks-url]: https://github.com/Mavyre/eaton-ipm-docker/network/members
[stars-shield]: https://img.shields.io/github/stars/Mavyre/eaton-ipm-docker.svg?style=for-the-badge
[stars-url]: https://github.com/Mavyre/eaton-ipm-docker/stargazers
[issues-shield]: https://img.shields.io/github/issues/Mavyre/eaton-ipm-docker.svg?style=for-the-badge
[issues-url]: https://github.com/Mavyre/eaton-ipm-docker/issues
[license-shield]: https://img.shields.io/github/license/Mavyre/eaton-ipm-docker.svg?style=for-the-badge
[license-url]: https://github.com/Mavyre/eaton-ipm-docker/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/bastien-vide
[product-screenshot]: https://www.storagereview.com/wp-content/uploads/2016/08/StorageReview-Eaton-IPM-Management-Node-List.jpg
[Docker.com]: https://img.shields.io/badge/Docker-384d54?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com/