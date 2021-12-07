import { useEffect } from 'react';
import LandingPage from './components/LandingPage';
import './App.css';
import Signup from './components/Signup';
import NavBar from './components/NavBar';
import Profile from './components/Profile';
import FollowList from './components/FollowList';

function App() {
 
  return (
  <>
    <LandingPage/>
    <br></br>
    <br></br>
    <br></br>
    <Signup/>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <NavBar/>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <Profile/>
    <br></br>
    <br></br>
    <br></br>
    <br></br>
    <FollowList/>


  </>
  );
}

export default App;
