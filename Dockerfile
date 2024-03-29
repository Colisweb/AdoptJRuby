# Copied from https://github.com/cpuguy83/docker-jruby/blob/baed0bc286dba0992746c2f9cbb311a1c945a16f/9000/jdk/Dockerfile
#
FROM jruby:9.2.19.0-jre11
# Fixes brought to this version:
# ------------------------------
#   - `netbase` is required. See: https://github.com/jruby/jruby/issues/3955#issuecomment-254504589
#   - `libfontconfig` is required. See: https://bugs.openjdk.java.net/browse/JDK-8204688
#
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y libc6-dev netbase libfontconfig --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# skip installing gem documentation
RUN mkdir -p /opt/jruby/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /opt/jruby/etc/gemrc

RUN gem install bundler rake net-telnet xmlrpc

# install things globally, for great justice
# and don't create ".bundle" in all our apps
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_BIN="$GEM_HOME/bin" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH
RUN mkdir -p "$GEM_HOME" "$BUNDLE_BIN" \
	&& chmod 777 "$GEM_HOME" "$BUNDLE_BIN"

CMD [ "irb" ]
