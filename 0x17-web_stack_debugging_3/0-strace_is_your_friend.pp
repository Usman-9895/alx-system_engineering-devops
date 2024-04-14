# 0-strace_is_your_friend.pp
class apache_fix {
  $target_file = '/var/www/html/wp-config.php'
  $template_content = @(END)
  <?php
  // Fichier de configuration wp-config.php exemple pour WordPress
  define('DB_NAME', 'nom_de_la_base_de_donnees_ici');
  define('DB_USER', 'nom_utilisateur_ici');
  define('DB_PASSWORD', 'mot_de_passe_ici');
  define('DB_HOST', 'localhost');
  define('DB_CHARSET', 'utf8');
  define('DB_COLLATE', '');
  /* Ajoutez des clés uniques et des sels */
  define('AUTH_KEY',         'mettez votre phrase unique ici');
  define('SECURE_AUTH_KEY',  'mettez votre phrase unique ici');
  define('LOGGED_IN_KEY',    'mettez votre phrase unique ici');
  define('NONCE_KEY',        'mettez votre phrase unique ici');
  define('AUTH_SALT',        'mettez votre phrase unique ici');
  define('SECURE_AUTH_SALT', 'mettez votre phrase unique ici');
  define('LOGGED_IN_SALT',   'mettez votre phrase unique ici');
  define('NONCE_SALT',       'mettez votre phrase unique ici');
  ?>
  END

  file { $target_file:
    ensure  => file,
    content => $template_content,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    require => Package['apache2'],
  }
}

include apache_fix

