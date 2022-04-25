<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220424165613 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE movie DROP FOREIGN KEY FK_1D5EF26F67B3B43D');
        $this->addSql('DROP INDEX IDX_1D5EF26F67B3B43D ON movie');
        $this->addSql('ALTER TABLE movie DROP users_id');
        $this->addSql('ALTER TABLE user ADD movies_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE user ADD CONSTRAINT FK_8D93D64953F590A4 FOREIGN KEY (movies_id) REFERENCES movie (id)');
        $this->addSql('CREATE INDEX IDX_8D93D64953F590A4 ON user (movies_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE movie ADD users_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE movie ADD CONSTRAINT FK_1D5EF26F67B3B43D FOREIGN KEY (users_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_1D5EF26F67B3B43D ON movie (users_id)');
        $this->addSql('ALTER TABLE user DROP FOREIGN KEY FK_8D93D64953F590A4');
        $this->addSql('DROP INDEX IDX_8D93D64953F590A4 ON user');
        $this->addSql('ALTER TABLE user DROP movies_id');
    }
}
