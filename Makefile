BIN_DIR=/usr/local/bin
CONF_DIR=/etc/ansible

.PHONY: install

install:
	install -m755 ansible-exec ${BIN_DIR}
	install -m644 ansible-exec.conf ${CONF_DIR}
