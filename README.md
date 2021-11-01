## SP Test task

### Description
___

Write a ruby script that:
* Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
* Returns the following:
    * > list of webpages with most page views ordered from most pages views to less page views e.g.:
      > 
        `/home 90 visits /index 80 visits`
    * > list of webpages with most unique page views also ordered e.g.:
      > 
      `/about/2 8 unique views /index 5 unique views`

### Installation
___

ruby version 3.0.0
```bash
$ git clone https://github.com/4ndeez/ruby-app.git
$ cd ruby_app 
$ bundle install
```

### Running script
___

`$ ruby bin/run.rb webserver.log`

### Output example
___
```
________________________________________
        MOST VIEWED PAGES BY DESC
________________________________________
/about/2       90 visits
/contact       89 visits
/index         82 visits
/about         81 visits
/help_page/1   80 visits
/home          78 visits
________________________________________
     MOST UNIQUE PAGE VIEWS BY DESC
________________________________________
/index         23 unique views
/home          23 unique views
/contact       23 unique views
/help_page/1   23 unique views
/about/2       22 unique views
/about         21 unique views
________________________________________
```