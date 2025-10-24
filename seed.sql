-- Seed data for Eguette SDakar

-- Insert menu categories
INSERT INTO menu_categories (name_fr, name_en, display_order) VALUES
  ('Bubble Waffles Sucrées', 'Sweet Bubble Waffles', 1),
  ('Bubble Waffles Salées', 'Savory Bubble Waffles', 2),
  ('Crêpes', 'Crepes', 3),
  ('Toasts', 'Toasts', 4),
  ('Hot-dogs Norvégiens', 'Norwegian Hot Dogs', 5),
  ('Desserts', 'Desserts', 6)
ON CONFLICT DO NOTHING;

-- Get category IDs for reference
DO $$
DECLARE
  cat_sweet_waffles uuid;
  cat_savory_waffles uuid;
  cat_crepes uuid;
  cat_toasts uuid;
  cat_hotdogs uuid;
  cat_desserts uuid;
BEGIN
  SELECT id INTO cat_sweet_waffles FROM menu_categories WHERE name_en = 'Sweet Bubble Waffles';
  SELECT id INTO cat_savory_waffles FROM menu_categories WHERE name_en = 'Savory Bubble Waffles';
  SELECT id INTO cat_crepes FROM menu_categories WHERE name_en = 'Crepes';
  SELECT id INTO cat_toasts FROM menu_categories WHERE name_en = 'Toasts';
  SELECT id INTO cat_hotdogs FROM menu_categories WHERE name_en = 'Norwegian Hot Dogs';
  SELECT id INTO cat_desserts FROM menu_categories WHERE name_en = 'Desserts';

  -- Insert menu items
  INSERT INTO menu_items (category_id, name_fr, name_en, description_fr, description_en, price, image_url, is_available, display_order) VALUES
    (cat_sweet_waffles, 'Bubble Waffle Chocolat', 'Chocolate Bubble Waffle', 'Gaufre hongkongaise avec chocolat fondu et fruits frais', 'Hong Kong waffle with melted chocolate and fresh fruits', 2000, 'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&w=400', true, 1),
    (cat_sweet_waffles, 'Bubble Waffle Nutella', 'Nutella Bubble Waffle', 'Gaufre avec Nutella, banane et noisettes', 'Waffle with Nutella, banana and hazelnuts', 2200, 'https://images.pexels.com/photos/4518664/pexels-photo-4518664.jpeg?auto=compress&cs=tinysrgb&w=400', true, 2),
    (cat_sweet_waffles, 'Bubble Waffle Fraise', 'Strawberry Bubble Waffle', 'Gaufre avec fraises fraîches et crème chantilly', 'Waffle with fresh strawberries and whipped cream', 2000, 'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&w=400', true, 3),
    (cat_savory_waffles, 'Bubble Waffle Fromage', 'Cheese Bubble Waffle', 'Gaufre salée avec fromage fondu', 'Savory waffle with melted cheese', 1800, 'https://images.pexels.com/photos/4518843/pexels-photo-4518843.jpeg?auto=compress&cs=tinysrgb&w=400', true, 1),
    (cat_savory_waffles, 'Bubble Waffle Poulet', 'Chicken Bubble Waffle', 'Gaufre avec poulet grillé et sauce spéciale', 'Waffle with grilled chicken and special sauce', 2500, 'https://images.pexels.com/photos/4518843/pexels-photo-4518843.jpeg?auto=compress&cs=tinysrgb&w=400', true, 2),
    (cat_crepes, 'Crêpe Nutella Banane', 'Nutella Banana Crepe', 'Crêpe classique avec Nutella et banane', 'Classic crepe with Nutella and banana', 1500, 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=400', true, 1),
    (cat_crepes, 'Crêpe Sucrée', 'Sugar Crepe', 'Crêpe simple avec sucre et citron', 'Simple crepe with sugar and lemon', 1000, 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=400', true, 2),
    (cat_crepes, 'Crêpe Complète', 'Complete Crepe', 'Crêpe salée avec jambon, fromage et œuf', 'Savory crepe with ham, cheese and egg', 2000, 'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=400', true, 3),
    (cat_toasts, 'Toast Avocat', 'Avocado Toast', 'Pain grillé avec avocat frais et tomate', 'Grilled bread with fresh avocado and tomato', 1800, 'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&w=400', true, 1),
    (cat_toasts, 'Toast Fromage', 'Cheese Toast', 'Pain grillé avec fromage fondu', 'Grilled bread with melted cheese', 1500, 'https://images.pexels.com/photos/1893555/pexels-photo-1893555.jpeg?auto=compress&cs=tinysrgb&w=400', true, 2),
    (cat_hotdogs, 'Hot-dog Classique', 'Classic Hot Dog', 'Hot-dog norvégien avec oignons frits et sauces', 'Norwegian hot dog with fried onions and sauces', 1500, 'https://images.pexels.com/photos/4518664/pexles-photo-4518664.jpeg?auto=compress&cs=tinysrgb&w=400', true, 1),
    (cat_hotdogs, 'Hot-dog Special', 'Special Hot Dog', 'Hot-dog avec tous les toppings', 'Hot dog with all toppings', 2000, 'https://images.pexels.com/photos/4518664/pexels-photo-4518664.jpeg?auto=compress&cs=tinysrgb&w=400', true, 2),
    (cat_desserts, 'Glace Artisanale', 'Artisan Ice Cream', 'Glace maison - parfums variés', 'Homemade ice cream - various flavors', 1000, 'https://images.pexels.com/photos/1352278/pexels-photo-1352278.jpeg?auto=compress&cs=tinysrgb&w=400', true, 1)
  ON CONFLICT DO NOTHING;
END $$;

-- Insert sample promotions
INSERT INTO promotions (title_fr, title_en, content_fr, content_en, is_active, discount_percentage, valid_from, valid_until) VALUES
  (
    'Offre de Lancement',
    'Launch Offer',
    'Profitez de 15% de réduction sur toutes les Bubble Waffles! Offre valable pour les 100 premiers clients.',
    'Enjoy 15% off all Bubble Waffles! Valid for the first 100 customers.',
    true,
    15,
    now(),
    now() + interval '30 days'
  ),
  (
    'Happy Hour',
    'Happy Hour',
    'De 15h à 18h, obtenez 10% de réduction sur toutes les commandes!',
    'From 3 PM to 6 PM, get 10% off all orders!',
    true,
    10,
    now(),
    now() + interval '60 days'
  )
ON CONFLICT DO NOTHING;

-- Insert sample reviews (pre-approved)
INSERT INTO reviews (customer_name, rating, comment, is_approved, created_at) VALUES
  ('Aminata D.', 5, 'Les meilleures bubble waffles de Dakar! Délicieuses et bien garnies. Je recommande vivement!', true, now() - interval '5 days'),
  ('John S.', 5, 'Amazing food! The Norwegian hot dogs are authentic and tasty. Great service too!', true, now() - interval '4 days'),
  ('Fatou M.', 4, 'Très bon, les crêpes sont excellentes. Seul bémol: parfois un peu d''attente aux heures de pointe.', true, now() - interval '3 days'),
  ('Pierre L.', 5, 'Food truck incontournable à Dakar! Tout est frais et préparé avec soin. Les toasts à l''avocat sont top!', true, now() - interval '2 days'),
  ('Sarah K.', 5, 'Best bubble waffles ever! The chocolate one is my favorite. Will definitely come back!', true, now() - interval '1 day'),
  ('Moussa B.', 5, 'Service rapide et nourriture délicieuse. Les hot-dogs norvégiens sont une vraie découverte!', true, now())
ON CONFLICT DO NOTHING;
