# Magento2 NGNIX PHP 7.1 Environment

This is a Docker environment for Magento2.

Compatible with Magento 2.2.1.

This image contains:
 * Ubuntu 16.04 LTS
 * NGINX
 * PHP7.1
 * Nano editor
 * MC filemanager
 * Optimal Settings For Magento
 * docker-compose what installs MySQL, Redish and PHPMyAdmin (optional)

## Usage

 1. Copy these files to your `Magento2 Project Root`
 2. Fill your authentication data in `auth.json`
 3. Check data in `env` file and modify them whatever you want.
 4. Run `docker-compose up web` command from your root (wait for ready)
 5. Enter the container `docker exec -it {YOUR_CONTAINER_NAME} bash`. (You can list your container the folllowing command `docker ps`.)
 6. Run `bin/install-magento` 
 7. Now You can reach Magento on http://localhost:8080

#### Host file Configuration

Add next row to your host file. You can modify the domain, but in this case modify in env file too.

```
127.0.0.1	magento.local
```

#### PHPMyAdmin Installation

Run next command from root:

```
docker-compose up phpmyadmin
```

If ready then you can reach PhpMyAdmin at http://localhost::8580

#### Run Magento commands

Enter the container `docker exec -it {YOUR_CONTAINER_NAME} bash`.

Now you can run commands. For example: `php bin/magento`

#### Synced Files

 * app
 * dev
 * pub/media
 * dev/tests/unit/phpunit.xml.dist
 * composer.json
 * composer.lock

