<?php
namespace App\Controller;
session_start();

use App\Entity\Movie;
use App\Entity\User;
use App\Repository\MovieRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PropertyAccess\PropertyAccessor;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
    /**
     * @Route("/", name="")
     * @param ManagerRegistry $registry
     * @return Response
     */
    public function index(ManagerRegistry $registry): Response
    {
        $userRepo = new UserRepository($registry);
        $users = $userRepo->fetchAll();

        if(count($users)==0)return $this->render('homePage.html.twig',['msg'=>'No movies found']);
        return $this->render('homePage.html.twig',['users'=>$users]);

    }


    /**
     * @Route("/register",name="register_user")
     * @param ManagerRegistry $registry
     * @param Request $request
     * @return Response
     */

    public function registerUser(ManagerRegistry $registry, Request $request):Response
    {
        if ($request->getMethod() == "POST") {
            if (strlen($request->request->get('password')) !== strlen($request->request->get('confirmPassword')))
                echo "<span style='color:red;'>Passwords are not the same</span>";
            else {
                $user = new User();
                $user->setFirstName($request->request->get('firstName'));
                $user->setLastName($request->request->get('lastName'));
                $user->setNickName($request->request->get('userName'));
                $user->setPassword($request->request->get('password'));
                $user->setEmail($request->request->get('email'));
                $userRepo = new UserRepository($registry);
                try {
                    $userRepo->add($user);
                    return $this->redirect('/');
                } catch (OptimisticLockException $e) {
                    echo $e;
                } catch (ORMException $e) {
                }
            }
            return $this->redirect('/login');
        }
        return $this->render('userRegister.html.twig');
    }

    /**
     * @Route("/validate", name="validation", methods = {"GET","POST"})
     * @param ManagerRegistry $manager
     * @param Request $request
     */

    public function validateUser(ManagerRegistry $manager, Request $request):Response{

        $propertyAccesor = new PropertyAccessor();
        $password = $request->request->get('password');
        $user = $manager->getRepository(User::class)->findOneBy(['password'=>$password]);
        if($user) {
            $_SESSION['user']=  $user;
            $firstname = $propertyAccesor->getValue($user, 'firstname');
            $lastname = $propertyAccesor->getValue($user, 'lastname');
            return $this->redirect('/userPage');
        }
        return $this->redirect('/login');
    }


    /**
     * @Route("/login",name="login_user")
     * @param Request $request
     * @return Response
     */

    public function loginUser(Request $request):Response
    {

        if ($request->getMethod() === "GET")
            return $this->render('login.html.twig');
        else
            return $this->redirectToRoute('validation');

    }
    /**
     * @Route("/add",name="add_movie",methods={"GET","POST"})
     * @param ManagerRegistry $registry
     * @param Request $request
     * @return Response
     * @throws \Exception
     */
    public function addMovie(ManagerRegistry $registry,Request $request):Response{
        if($request->getMethod()=="GET")
            return $this->render('addMovie.html.twig');
        else{
            $movie = new Movie();
            $movie->setTitle($request->request->get('title'));
            $movie->setDescr($request->request->get('desc'));
            $user = $_SESSION['user'];
            $movie->setUser($user);
            $movie->setDatePosted(date("Y:m:d"));
            $movieRepo = new MovieRepository($registry);
            $movieRepo->add($movie);
            return $this->redirect('/userPage');
        }

    }

    /**
     * @Route("/userPage", name="user_page", methods = {"GET"})
     * @param ManagerRegistry $registry
     * @return Response
     */

    public function userPage(ManagerRegistry $registry):Response{
        $usersRepo = new UserRepository($registry);
        $users = $usersRepo->fetchAll();
        $userAccesor = new PropertyAccessor();
        $id = $userAccesor->getValue($_SESSION['user'],'id');
        return $this->render('userPage.html.twig',['users'=>$users,'id'=>$id]);
    }

    /**
     * @Route("/date-sort", name="sort_movies_by_date")
     * @param ManagerRegistry $manager
     */

    public function sortMoviesByDate(ManagerRegistry $manager){
        $repo = new MovieRepository($manager);
        $usersRepo = new UserRepository($manager);
        return $this->redirectToRoute('user_page',['movies'=>$repo->sortByDate(),'users'=>$usersRepo->fetchAll()]);


    }

}
