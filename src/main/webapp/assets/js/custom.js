/**
 * 
 */

document.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('get-started-btn');
  const roleOptions = document.getElementById('role-options');

  btn.addEventListener('click', (e) => {
    e.preventDefault();
    roleOptions.classList.add('show');
    // ❌ No scrolling anymore
  });
});