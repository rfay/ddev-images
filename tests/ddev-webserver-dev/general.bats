#!/usr/bin/env bats

@test "Verify required binaries are installed in container" {
    COMMANDS="ddev-live terminus drupal magerun magerun2 drush mkcert"
    for item in $COMMANDS; do
       docker exec $CONTAINER_NAME bash -c "command -v $item >/dev/null"
    done
}

@test "Verify /var/www/html/vendor/bin is in PATH on ddev/docker exec" {
    docker exec $CONTAINER_NAME bash -c 'echo $PATH | grep /var/www/html/vendor/bin'
}
