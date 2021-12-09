import { useContext, useEffect, useState } from 'react';
import {Routes, Route} from 'react-router-dom'
import LandingPage from './components/LandingPage';
import NavBar from './components/NavBar';
import Profile from './components/Profile';
import FollowList from './components/FollowList';
import './App.css';
import BlogFeed from './components/BlogFeed';
import BlogPost from './components/BlogPost';
import BlogForm from './components/BlogForm';
import { UserContext } from './context/user';


function App() {
  const {user, setUser} = useContext(UserContext);

  useEffect(() => {
    fetch('/me')
      .then(resp => {
        if (resp.ok) resp.json().then(data=> setUser(data))
        else resp.json().then(errors=> console.log(errors))})
      }, [])
      

if(!user)
return (<LandingPage />)
else
  return (
  <>
    <NavBar />
    <Routes>
      <Route path='/' element={<BlogFeed />}></Route>
      <Route path='/blogs' element={<BlogFeed />}></Route>
      <Route path={`/users/:username`} element={<Profile />}></Route>
      <Route path='/followers/:username' element={<FollowList/>}></Route>
      <Route path='/blogs/:id' element={<BlogPost/>}></Route>
      <Route path='/blogs/new' element={<BlogForm/>}></Route>
      <Route path={'/blogs/:id/edit'} element={<BlogForm/>}></Route>
    </Routes>
   
    


  </>
  );
}

export default App;
