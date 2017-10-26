# README

To run, make sure you have redis installed and running so you can bundle install and start a worker:

    $ bundle install
    $ QUEUE="*" rake resque:work

Then, start the rails server and enjoy!

To run specs:


    $ rspec



