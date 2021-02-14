#help:  ## show this help123
#	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
#common:
#	@sh components/common.sh
#cart:common     ## install cart component
#cart:   #install cart component
#	@sh components/cart.sh
	#@sudo sh components/cart.sh   <when run 'make fronend' with normal user, it will ask aurtize, need to give this line
#catalogue:common     ## install catalogue component
#	@sh components/catalogue.sh
#frontend:common     ##  install frontend component
#	@sh components/frontend.sh
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
