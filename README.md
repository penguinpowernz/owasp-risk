# OWASP Risk Tracker

Track and evaluate the risk of your known vulnerabilities across projects using the [OWASP Risk Evaluation Methodology](https://owasp.org/www-community/OWASP_Risk_Rating_Methodology). Use the
risk scores for each to determine the highest severity vulnerabilities to fix.

## How to run

This will start the application:

    $ git clone https://github.com/penguinpowernz/owasp-risk
    $ cd owasp-risk
    $ docker run --name owasp-risk \
        -p 3000:3000 \
        -v "$(pwd):/app" \
        -it \
        -w /app \
        ruby \
        scripts/docker-entrypoint rails server -b 0.0.0.0

## Usage

The following entities can be modified:

- Projects - collections of vulnerabilities
- Vulnerabilities - a known vulnerability that has a risk rating for each potential threat agent
- Threat Agents - creates risk by exploiting vulnerabilites, of different sizes and skill levels
- Risks - the risk that presents a score calculated from threat agents, likelihoods and impacts

The following concepts are represented:

- likelihood
    - threat agent factors
    - vulnerability factors
- impact
    - technical impact factors
    - business impact factors

This provides a useful interface for assigning, calculating and tracking the risks of
vulnerabilities in your projects to determine ticket priority.

Also, the factors and their scores are pre-populated with the defaults from the methodology but
it is possible to add/change/delete the evaluation factors to fit to your organisation.