## Blocipedia 

This is a production quality SaaS app that will allow users to create their own wikis. This app was built as a project assignment for my [Bloc](https://www.bloc.io) course.

#### Notes

* User authentication was built from scratch as opposed to using Devise. [Figaro](https://github.com/laserlemon/figaro) was used to protect email credentials.

* [Pundit](https://github.com/elabs/pundit) was used to handle authorization since we have different user roles: Standard (default role) and Premium. 

* [Stripe](https://stripe.com/) was incorporated in order to be able to charge users when upgrading their accounts. 

* When users downgrade, the role is automatically changed from Premium back to Standard.

* [Redcarpet](https://github.com/vmg/redcarpet) was used to parse Markdown syntax. This will allow for further customization and overall better user experience when viewing wiki pages built with Markdown.

* [will_paginate](https://github.com/mislav/will_paginate) was used to paginate the Wiki views.

Hosted app can be found via [Heroku](http://liz11-blocipedia.herokuapp.com/). 

Checkout the full case story on my [my portfolio](http://www.lizelottegreen.info/portfolio/blocipedia.html).