import { useEffect, useState } from 'react';
import LandingPage from './components/LandingPage';
import './App.css';
import Signup from './components/Signup';
import NavBar from './components/NavBar';
import Profile from './components/Profile';
import FollowList from './components/FollowList';
import Login from './components/Login';

function App() {
  const [username, setUsername] = useState('')

  useEffect(() => {
    fetch('/me')
      .then(resp => resp.json())
      .then(data => console.log(data))
      .catch(e => console.error(e))
  }, [username])

  return (
  <>
    {username}
    <LandingPage/>
    <br></br>
    <br></br>
    <br></br>
    <Login setUsername={setUsername} />
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
