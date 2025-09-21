<!-- From my boilerplate ~ GinasaurusRx -->

# Setup

```bash

# Ensure we're using correct version of Ruby on Rails
ruby -v
rbenv local 3.4.5
source ~/.zshrc 

# initialize backend with Rails
rails new backend --api 

# initialize frontend with React
npx create-react-app frontend


cd frontend
npm start




```

Structure
```
> tree -L 2
.
├── backend
│   ├── app
│   ├── bin
│   ├── config
│   ├── config.ru
│   ├── db
│   ├── Dockerfile
│   ├── Gemfile
│   ├── Gemfile.lock
│   ├── lib
│   ├── log
│   ├── public
│   ├── Rakefile
│   ├── README.md
│   ├── script
│   ├── storage
│   ├── test
│   ├── tmp
│   └── vendor
├── frontend
│   ├── node_modules
│   ├── package-lock.json
│   ├── package.json
│   ├── public
│   ├── README.md
│   └── src
├── README.md
└── z-notes
    ├── hello_world.rb
    ├── rattleship.rb
    ├── README.md
    ├── simple_calculator.rb
    ├── string_manipulation.rb
    ├── syntax_notes.md
    └── token_mgt.md

19 directories, 17 files
```
