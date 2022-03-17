FROM  elixir:latest AS builder

ENV MIX_ENV=prod

WORKDIR /opt/app


# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do local.rebar --force, local.hex --force, deps.get, deps.compile

ADD . .

CMD ["mix", "phx.server"]


# FROM  elixir:latest 

# EXPOSE 5000
# ENV PORT=5000 MIX_ENV=prod

# COPY --from=builder /opt/app/_build /opt/app/_build
# COPY --from=builder /opt/app/priv /opt/app/priv
# COPY --from=builder /opt/app/config /opt/app/config
# COPY --from=builder /opt/app/lib /opt/app/lib
# COPY --from=builder /opt/app/deps /opt/app/deps
# COPY --from=builder /opt/app/.mix /opt/app/.mix
# COPY --from=builder /opt/app/mix.* /opt/app/

# # alternatively you can just copy the whole dir over with:
# # COPY --from=phx-builder /opt/app /opt/app
# # be warned, this will however copy over non-build files

# USER default

# CMD ["mix", "phx.server"]