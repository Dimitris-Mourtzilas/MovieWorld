<?php

namespace App\Controller;

use http\Env\Request;
use Symfony\Bridge\Doctrine\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\User;

class UserController extends AbstractController
{
    /**
     * @Route("/", name="login")
     */
    public function index(): Response
    {
        return $this->render('login.html.twig');
    }
//
//    /**
//     * @Route("/add",mame="add_user")
//     */
//
////    public function addUser():Response{
//        $user = new User();
//    }
//


    /**
     * @param ManagerRegistry $manager
     * @param Request $request
     * @return Response
     */

    public function validateUser(ManagerRegistry $manager,Request $request):Response{
        $data = $request->re
    $users = $manager->getRepository(User::class)->find($password);
    if(!$users){
        throw $this->createNotFoundException("Wrong credentials. Please try again");
    }
    return $this->render("home.html.twig");
}
}
