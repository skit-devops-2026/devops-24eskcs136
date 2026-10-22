FROM php:8.2-apache

# Install MySQLi extension for PHP database interaction and enable mod_rewrite
RUN docker-php-ext-install mysqli \
    && a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy application source code
COPY . /var/www/html/

# Set proper permissions for Apache user
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose standard HTTP port
EXPOSE 80

# Healthcheck to verify the web service is responding
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/health || exit 1

# Start Apache in the foreground
CMD ["apache2-foreground"]
