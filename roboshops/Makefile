help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
common:
	@sh components/common.sh
cart:common
cart:common
	@sh components/cart.sh
	#@sudo sh components/cart.sh   <when run 'make fronend' with normal user, it will ask aurtize, need to give this line
catalogue:common
	@sh components/catalogue.sh
frontend:common
	@sh components/frontend.sh
