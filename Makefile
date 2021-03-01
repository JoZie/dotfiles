
uninstall-%:
	@stow -D $(subst uninstall-,,$@)

install-%:
	@stow -S $(subst install-,,$@)
