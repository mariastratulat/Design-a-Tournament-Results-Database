# Design a Tournament Results Database


For running this application make sure you have installed:

  - Vagrant  [https://www.vagrantup.com/]
  - Virtual Box [https://www.virtualbox.org/]
  - Python 2.7

Launch the VB from your terminal:

    - vagrant up
    - vagrant ssh
    
Run the application:

    - cd /vagrant/tournament/
    - psql
    - \i tournament.sql  (will import the sql file and create the database, tables, views)
    - \q 
    - python tournament_test.py (will run the tests)
"# Design-a-Tournament-Results-Database" 
