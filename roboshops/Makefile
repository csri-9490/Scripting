help:  ## show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common:
	@sh components/common.sh

cart: common     	## install cart component
	@sh components/cart.sh

catalogue:common     ## install catalogue component
	@sh components/catalogue.sh
frontend: common
frontend:  ##  install frontend component
	@sh components/frontend.sh
mongodb:common
	@sh components/mongodb.sh
