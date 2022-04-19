<?php

namespace App\Entity;

use App\Repository\MovieRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MovieRepository::class)
 */
class Movie
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=25)
     */
    private $movie_title;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $movie_desc;

    /**
     * @ORM\Column(type="date")
     */
    private $date_posted;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getMovieTitle(): ?string
    {
        return $this->movie_title;
    }

    public function setMovieTitle(string $movie_title): self
    {
        $this->movie_title = $movie_title;

        return $this;
    }

    public function getMovieDesc(): ?string
    {
        return $this->movie_desc;
    }

    public function setMovieDesc(string $movie_desc): self
    {
        $this->movie_desc = $movie_desc;

        return $this;
    }

    public function getDatePosted(): ?\DateTimeInterface
    {
        return $this->date_posted;
    }

    public function setDatePosted(\DateTimeInterface $date_posted): self
    {
        $this->date_posted = $date_posted;

        return $this;
    }
}
