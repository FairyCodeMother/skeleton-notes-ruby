import { useEffect, useState } from 'react';
import './App.css';

function App() {
  const [theme, setTheme] = useState('dark');

  // on page load
  useEffect(()=>{
    document.body.setAttribute('data-theme', theme);
  }, [theme]);

  const toggleTheme = () => {
    setTheme(theme === 'light' ? 'dark' : 'light');
  };

  console.log(`toggleTheme: ${toggleTheme}`);

  return (
    <div className="app">
      <header className="header">
        <div className='header-nav'>

          <button
            onClick={toggleTheme}
            className='nav-btn theme'
          >
            Theme: {theme}
          </button>

          <button className='nav-btn resume'>
            Resume
          </button>
          <button className='nav-btn home'>
            Gina Hall
          </button>
          <button className='nav-btn worksona'>
            Worksona
          </button>
          <button className='nav-btn skeletons'>
            Skeletons
          </button>
        </div>
      </header>
      <main className='main'>
        GinasaurusRx Body
      </main>
    </div>
  );
}

export default App;
