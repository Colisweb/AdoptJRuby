# Copied from https://github.com/cpuguy83/docker-jruby/blob/baed0bc286dba0992746c2f9cbb311a1c945a16f/9000/jdk/Dockerfile
#
FROM adoptopenjdk/openjdk11:jdk-11.0.2.9-slim

# Fixes brought to this version:
# ------------------------------
#   - `netbase` is required. See: https://github.com/jruby/jruby/issues/3955#issuecomment-254504589
#   - `libfontconfig` is required. See: https://bugs.openjdk.java.net/browse/JDK-8204688
#
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y libc6-dev netbase libfontconfig git maven ant build-essential --no-install-recommends && \
    cd /opt && \
    git clone --depth 1 -b fiber_enumerator_next https://github.com/guizmaii/jruby && \
    cd jruby && \
    rm -rf .git && \
    ./mvnw && \
    update-alternatives --install /usr/local/bin/ruby ruby /opt/jruby/bin/jruby 1 && \
    apt-get remove -y git maven ant build-essential && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV PATH /opt/jruby/bin:$PATH

# skip installing gem documentation
RUN mkdir -p /opt/jruby/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /opt/jruby/etc/gemrc

RUN gem update --system && gem install bundler rake net-telnet xmlrpc

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
